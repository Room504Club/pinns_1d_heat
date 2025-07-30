# PINNs：1D 热传导正问题

使用 DeepXDE 框架，通过物理信息神经网络（PINNs）求解一维热传导方程，并生成动态图与追踪热图。

## 结构
- 环境配置：00_env_setup.md
- 问题介绍：01_problem_intro.md
- 模型训练：02_pinn_model.md
- 动画可视化：03_visualization.md
```
pinns-1d-heat/
├── 00_env_setup.md               # 环境搭建说明
├── 01_problem_intro.md           # 一维热传导：物理与数学模型
├── 02_pinn_model.md              # PINNs 模型构建与训练代码
├── 03_visualization.md           # 动画与可视化代码 + 效果截图
├── animation_heatmap.mp4         # 导出动画文件（可选）
├── .gitignore                    # 忽略 .ipynb_checkpoints 等
└── README.md                     # 简要说明（可作为 GitHub 首页）

```

## 内容：
- PDE 模型建立
- PINN 网络构建与训练
- 动态可视化
- Obsidian + Git 笔记工作流
🎥 动画文件：`animation_heatmap.mp4`

## 环境依赖：
- Python 3.10
- deepxde
- torch
- matplotlib
- jupyterlab