# vue脚手架结构

 ### vue脚手架总文件夹结构
    - build
    - config
    - node-modules
    - src
    - static
<div align=center><img src="https://images2017.cnblogs.com/blog/916533/201801/916533-20180118181001443-1283702699.png"/></div>



### build文件夹
<div align=center><img src="https://images2017.cnblogs.com/blog/916533/201801/916533-20180118181038803-812248862.png"/></div>



### config文件夹
<div align=center><img src="https://images2017.cnblogs.com/blog/916533/201801/916533-20180118181124068-169648827.png"/></div>



## vue项目主要文件

  ### index.html文件
    (说明：一般只定义一个空的根节点，在main.js里面定义的实例将挂载在#app节点下，内容通过vue组件填充)
  <div align=center><img src="https://images2017.cnblogs.com/blog/916533/201801/916533-20180119092842974-1602031929.png"/></div>
  
  
   ### App.vue文件
    (说明：app.vue是项目的主组件，所有页面都是在app.vue下切换的。一个标准的vue文件，分为三部分。

     第一装写html代码在<template></template>中，一般在此下面只能定义一个根节点；

     第二<script></script>标签；

     第三<style scoped></style>用来写样式，其中scoped表示。该style作用于只在当前组件的节点及其子节点，但是不包含子组件呦。

     <router-view></router-view>是子路由视图，后面的路由页面都显示在此处，相当于一个指示标，指引显示哪个页面。)
  <div align=center><img src="https://images2017.cnblogs.com/blog/916533/201801/916533-20180119093833459-1224596892.png"/></div>


  ### main.js文件
    (说明：入口文件来着，主要作用是初始化vue实例并使用需要的插件。比如下面引用了4个插件，但只用了app（components里面是引用的插件）)
  <div align=center><img src="https://images2017.cnblogs.com/blog/916533/201801/916533-20180119100134474-1003780139.png"/></div>


  ### router下面的index.js
    (说明：路由配置文件)
  <div align=center><img src="https://images2017.cnblogs.com/blog/916533/201801/916533-20180119101556334-1868956418.png"/></div>













<div alin=center>

     <a href='https://www.cnblogs.com/hongdiandian/p/8317989.html'>vue-cli脚手架之build文件夹上半部</a>

     <a href='https://www.cnblogs.com/hongdiandian/p/8318552.html'>vue-cli脚手架之webpack.base.conf.js</a>

     <a href='https://www.cnblogs.com/hongdiandian/p/8319506.html'>vue-cli脚手架之webpack.dev.conf.js</a>

     <a href='https://www.cnblogs.com/hongdiandian/p/8319514.html'>vue-cli脚手架之webpack.prod.conf.js</a>

     <a href='https://www.cnblogs.com/hongdiandian/p/8319516.html'>vue-cli脚手架之webpack.test.conf.js</a>

     <a href='https://www.cnblogs.com/hongdiandian/p/8321039.html'>vue-cli脚手架之package.json</a>

     <a href='https://www.cnblogs.com/hongdiandian/p/8321741.html'>vue-cli脚手架之其他文件解释</a>
</div>
