# Resnet Ensemble
[tensorflow/models/slim](https://github.com/tensorflow/models/tree/master/slim) 에서 evaluation 하는데 필요한 파일만 수정해서 올렸습니다. Ensemble은 각 model에서 나온 output을 평균한 후 softmax에 넣는 방법으로 했습니다.

## Dataset
[Food validation data](https://drive.google.com/open?id=0B8AJ1FOXWIi5YWFzT0p3ZHNpdGM)

## Checkpoints Files
[Resnet 50 checkpoints files](https://drive.google.com/open?id=0B8AJ1FOXWIi5SnVhaENTd0dRSGs)

## Evaluation
```
DATASET_DIR=data
CHECKPOINT_DIR=checkpoints/resnet_50_1_100000.ckpt,checkpoints/resnet_50_2_100000.ckpt,checkpoints/resnet_50_3_100000.ckpt
python eval_image_classifier_ensemble.py \
	--alsologtostderr \
	--checkpoint_path=${CHECKPOINT_DIR} \
	--dataset_dir=${DATASET_DIR} \
	--dataset_name=food \
	--dataset_split_name=validation \
	--model_name=resnet_v2_50
```

## Result
Model | Top 1 Accuracy | Top 5 Accuracy
:------:|:---------------:|:---------------------:
Resnet_50_1 | 0.676 | 0.885
Resnet_50_2 | 0.674 | 0.877
Resnet_50_3 | 0.675 | 0.880
Ensemble | 0.738 | 0.914
위의 결과와 같이 ensemble을 하니 top 1 accuracy가 0.6정도 증가하고 top 5 accuracy가 0.3정도 증가했습니다.
