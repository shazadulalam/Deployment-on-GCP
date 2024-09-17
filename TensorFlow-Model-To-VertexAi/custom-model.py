import tensorflow as tf
from tensorflow import keras

# Loading the Fashion MNIST dataset
fashion_mnist = keras.datasets.fashion_mnist
(train_images, train_labels), (test_images, test_labels) = fashion_mnist.load_data()

# normalization and reshaping the model input
train_images = train_images / 255.0
test_images = test_images / 255.0

train_images = train_images.reshape(train_images.shape[0], 28, 28, 1)
test_images = test_images.reshape(test_images.shape[0], 28, 28, 1)


model = keras.Sequential([
    keras.layers.Conv2D(input_shape=(28, 28, 1), filters=8, kernel_size=3, 
                        strides=2, activation='relu', name='Conv1'),
    keras.layers.Flatten(),
    keras.layers.Dense(10, name='Dense')
])

model.summary()


model.compile(optimizer='adam', 
              loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=[keras.metrics.SparseCategoricalAccuracy()])


epochs = 100
model.fit(train_images, train_labels, epochs=epochs)


test_loss, test_acc = model.evaluate(test_images, test_labels, verbose=1)
print('\nTest accuracy: {}'.format(test_acc))

# Saving the model to GCS
EXPORT_PATH = 'gs://ml-custom-models/export/fashion_mnist_model'
model.save(EXPORT_PATH)