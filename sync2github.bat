@echo off 
cd /d "C:\Utopia\TheLibraryAtMountChar\PINNs\pinns_1d_heat" 

git add . 

git commit -m "手动同步：更新内容 %date% %time%" 

git push 

echo. 

echo ==== ✅ GitHub 同步完成 ==== 

pause