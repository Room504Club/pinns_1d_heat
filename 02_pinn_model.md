# PINNs 模型代码（使用 DeepXDE + PyTorch）

## 1. 定义物理区域

```python
import deepxde as dde
import numpy as np

# 几何区域
geom = dde.geometry.Interval(0, 1)
timedomain = dde.geometry.TimeDomain(0, 1)
geomtime = dde.geometry.GeometryXTime(geom, timedomain)
```

## 2. 构建 PDE 和初始/边界条件
```python
# PDE
def pde(x, u):
    du_t = dde.grad.jacobian(u, x, j=1)
    du_xx = dde.grad.hessian(u, x, i=0, j=0)
    return du_t - du_xx

# 初始与边界条件
def initial_func(x):
    return np.sin(np.pi * x[:, 0:1])

bc = dde.DirichletBC(geomtime, lambda x: 0, lambda x, on_boundary: on_boundary)
ic = dde.IC(geomtime, initial_func, lambda x, on_initial: on_initial)
```

## 3. 构建神经网络
```python
# 神经网络
net = dde.maps.FNN([2] + [50]*3 + [1], "tanh", "Glorot uniform")
data = dde.data.TimePDE(geomtime, pde, [bc, ic], num_domain=10000, num_boundary=100, num_initial=100)
model = dde.Model(data, net)
```

## 4. 训练模型
```python
model.compile("adam", lr=1e-3)
losshistory, train_state = model.train(epochs=5000)
```
