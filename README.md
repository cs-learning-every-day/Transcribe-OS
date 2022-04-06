> [Origin Repository](https://github.com/elephantos/elephant)
> [配置参考](https://www.cnblogs.com/Cl0ud/p/14100624.html)


### Tiny OS

**草草草，不小心把WSL删除了。草草草，搞配置一下午(其实没有错)，效果出不来(我运行的是第二章的代码~~以前读到这~~，然后运行后一直黑屏，后面不小心翻到书P64发现那个黑屏是bochs控制台，要输入c才会执行)。后悔不赶紧看完本书，非得拖。**

> 如果出现disk.img错误把当前的disk.img.lock删除掉就OK了

#### 环境配置
书中有讲，还是搞了半天，~~Bochs跟书中版本一致~~。(在ubuntu下)
```shell
缺少头文件 <gtk/gtk.h>
sudo apt-get install libgtk2.0-dev
```
> 可以傻瓜式安装, 将config/bochs* 移动到~ 然后 sh config.sh

#### Bochs
每个章节下的bios配置部分应视bochs的具体版本而定，可自行修改：

```html
# 对应真实机器的bios
romimage: file=/home/tesla/tools/bochs-2.6.2/share/bochs/BIOS-bochs-latest
# 对应真实机器的VGA bios
vgaromimage: file=/home/tesla/tools/bochs-2.6.2/share/bochs/VGABIOS-lgpl-latest
```

### 说明

每个章节下的代码均可以独立运行，在对应的目录下执行以下命令即可启动：

```shell
./build.sh
```

即可启动执行。完毕之后可执行以下命令清理环境：

```shell
./clean.sh
```

### 运行
