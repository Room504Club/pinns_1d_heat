# 动画可视化与追踪线演示

## 1. 热图动画+动态追踪线
```python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from IPython.display import HTML

x = np.linspace(0, 1, 100)
t = np.linspace(0, 1, 100)
X, T = np.meshgrid(x, t)
U = np.zeros_like(X)

for i, t_val in enumerate(t):
    xt = np.hstack((x.reshape(-1, 1), np.full((len(x), 1), t_val)))
    u_pred = model.predict(xt).flatten()
    U[i, :] = u_pred

fig, ax = plt.subplots()
cax = ax.imshow(np.zeros_like(U), extent=[0, 1, 0, 1], origin='lower',
                aspect='auto', cmap='hot', vmin=-1, vmax=1)
fig.colorbar(cax, label="温度 u(x,t)")
tracker_line = ax.axhline(y=0, color='cyan', linestyle='--', linewidth=2, label="当前时刻")
ax.legend()
ax.set_xlabel("x")
ax.set_ylabel("t")
ax.set_title("热传导动态热图")

def init():
    cax.set_data(np.zeros_like(U))
    tracker_line.set_ydata([0, 0])
    return [cax, tracker_line]

def update(frame):
    U_display = np.copy(U)
    U_display[frame+1:, :] = np.nan
    cax.set_data(U_display)
    tracker_line.set_ydata([t[frame], t[frame]])
    ax.set_title(f"热传导动态热图 - t = {t[frame]:.2f}")
    return [cax, tracker_line]

ani = animation.FuncAnimation(fig, update, frames=len(t),
                              init_func=init, interval=100, blit=False)


HTML(ani.to_jshtml())
```

## 2. 导出动画为MP4
```python
# 保存为 mp4
ani.save("animation_heatmap.mp4", writer="ffmpeg", fps=20)
```
## 3. 效果说明

- 使用 `imshow()` 绘制固定坐标热图
    
- 使用 `axhline()` 添加追踪时间线
    
- 每帧预测 u(x,t)，动态更新热图和追踪线