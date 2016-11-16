DATASET_DIR=data
CHECKPOINT_DIR=checkpoints/resnet_50_1_100000.ckpt,checkpoints/resnet_50_2_100000.ckpt,checkpoints/resnet_50_3_100000.ckpt
python eval_image_classifier_ensemble.py \
	--alsologtostderr \
	--checkpoint_path=${CHECKPOINT_DIR} \
	--dataset_dir=${DATASET_DIR} \
	--dataset_name=food \
	--dataset_split_name=validation \
	--model_name=resnet_v2_50
