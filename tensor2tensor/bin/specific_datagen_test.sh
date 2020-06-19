#!/bin/bash



export TPU_IP_ADDRESS=10.218.218.146
export XRT_TPU_CONFIG="tpu_worker;0;$TPU_IP_ADDRESS:8470"
export PROBLEM=algorithmic_math_deepmind_all
export MODEL=transformer
export HPARAMS_SET=transformer_tpu
export TPU_NAME=actualmathstpu  # different for each run
export STORAGE_BUCKET=gs://mathsreasoning
export MODEL_TAG=mds_paper_settings
# export MODEL_TAG=${MODEL_TAG}-$(date +%F)
export MODEL_TAG=${MODEL_TAG}-2020-06-12
export DATA_DIR=${STORAGE_BUCKET}/t2t-data
export TMP_DIR=${STORAGE_BUCKET} # /mathematics_dataset-v1.0
export TRAIN_DIR=${STORAGE_BUCKET}/t2t_train/$PROBLEM/$MODEL-$MODEL_TAG
export BEAM_SIZE=4
export ALPHA=0.6
export DECODE_FILE=$HOME/test_file.txt
export DECODE_OUTPUT=$HOME/output.txt
echo $PROBLEM
echo $MODEL
echo $HPARAMS_SET
echo $TPU_NAME
echo $STORAGE_BUCKET
echo $MODEL_TAG
echo $MODEL_TAG
echo $DATA_DIR
echo $TMP_DIR
echo $TRAIN_DIR
echo $BEAM_SIZE
echo $ALPHA
echo $DECODE_FILE
echo $DECODE_OUTPUT



t2t-datagen \
  --problem=$PROBLEM \
  --data_dir=$DATA_DIR \
  --tmp_dir=TMP_DIR


# t2t-eval \
#   --problem=$PROBLEM \
#   --model=$MODEL \
#   --data_dir=$DATA_DIR \
#   --output_dir=$TRAIN_DIR \
#   --eval_use_test_set=False \
#   --hparams_set=$HPARAMS_SET \
#   --use_tpu=True \
#   --cloud_tpu_name=jonmcwong-tpu

# t2t-decoder \
#   --data_dir=$DATA_DIR \
#   --problem=$PROBLEM \
#   --model=$MODEL \
#   --hparams_set=$HPARAMS_SET \
#   --output_dir=$TRAIN_DIR \
#   --decode_hparams="beam_size=$BEAM_SIZE,alpha=$ALPHA" \
#   --decode_from_file=$DATA_SHARD \
#   --decode_to_file=$DECODE_OUTPUT

#   --decode_from_file=$DECODE_FILE \


# '\n\n                                   ._ o o\n                                   \\_`-)|_\n                                ,""       \\ \n                              ,"  ## |   ಠ ಠ. \n                            ," ##   ,-\\__    `.\n                          ,"       /     `--._;)\n                        ,"     ## /\n                      ,"   ##    /\n\n\n'

  
# class MetricsTest(tf.test.TestCase):

#   def testAccuracyMetric(self):
#     predictions = np.random.randint(1, 5, size=(12, 12, 12, 1))
#     targets = np.random.randint(1, 5, size=(12, 12, 12, 1))
#     expected = np.mean((predictions == targets).astype(float))
#     with self.test_session() as session:
#       scores, _ = metrics.padded_accuracy(
#           tf.one_hot(predictions, depth=5, dtype=tf.float32),
#           tf.constant(targets, dtype=tf.int32))
#       a = tf.reduce_mean(scores)
#       session.run(tf.global_variables_initializer())
#       actual = session.run(a)
#     self.assertAlmostEqual(actual, expected)
