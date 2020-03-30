# git_for_ROS
example repo for how you might set up git for a catkin_ws in ROS 

## Disclaimer: This is the way I have found useful, since I often use submodules, there are probably other and better ways to use Git with catkin_ws!


## Submodules
[Git-Tools-Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

I tend to develop all of my code as individual repositories. 
This means that they can be integrated into multiple catkin_ws projects by using submodules

```bash
git submodule add https://github.com/EEE
```
You can also use submodules to add code from public repos, but frozen at a specific commit. E.g., 

```bash
git submodule add https://github.com/tu-darmstadt-ros-pkg/hector_slam.git 
```


## Config files and .bashrc


## Using branches

