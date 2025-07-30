# 环境配置指南（Windows + Anaconda）

## 1. 创建 Conda 环境
```bash
conda create -n pinns-env python=3.10
conda activate pinns-env
```

## 2. 安装 DeepXDE 和 PyTorch
```bash
pip install deepxde
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

## 3. 安装 Jupyter Lab 并注册内核
```bash
pip install jupyterlab ipykernel
python -m ipykernel install --user --name pinns-env --display-name "Python (PINNs)"
```

## 4. 验证 CUDA 和 DeepXDE
```python
import torch
print(torch.cuda.is_available())
print(torch.cuda.get_device_name(0))

import deepxde as dde
print(dde.__version__)
```
