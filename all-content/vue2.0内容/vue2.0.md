##vue 中学习点
----------------
1.代码规范
```
1.props最好写成对象形式
例如：
props：{
  test：{
    type：String,
    default:''
  }
}

2.组件名称最好要以大驼峰式写法
例如：
name: TestComponents
<TestComponents></TestComponents>

3.子传父的时候最好是隐形式
例如：@click='$emit(test,test)'

4.最好不使用scoped属性

5.属性行分行写
例如：
<div 
  @cilck='test'
  v-if='test'
  class='active>
  {{ test }}
</div>
```
2.知识点学习
```
1.vue---混入minxins
使用场景：
例如我们在Vue单页面开发的时候当多个组件中都需要下拉刷新，或者使用的都是一个方法的时候，我们就可以使用vue mixins进行封装调用，以及继承，具体看代码。

代码：
var mixin = {
                data: function () {
                return {
                  message: 'hello'
                }
              },
              created:function(){
                console.log('我是mixins中的created')
              },
              methods:{
                show:function(num){
                    console.log(num)  //mixins种的函数可以接收组件种的传参。
                },
                foo: function () {
                  console.log('foo')
                },
                conflicting: function () {
                  console.log('from mixin')
                }
              }
            }

            var vm = new Vue({
              mixins: [mixin],
              data: function () {
                return {
                  title: 'def',
                  message: 'goodbye'
                }
              },
              created: function () {
                console.log('我是Vue中的created')
                console.log(this.$data)
                this.show(50);  //可通过函数传参,把组件中需要的参数传给mixins进行使用。
              },
              methods:{
                bar: function () {
                  console.log('bar')
                },
                conflicting: function () {
                  console.log('from self')
                }
              }
            })
            
            vm.foo() // => "foo"
            vm.bar() // => "bar"
            vm.conflicting() // => "from self"
```
