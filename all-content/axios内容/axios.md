```
import axios from 'axios'
import qs from 'qs'
import state from './store/state'

let exportDefault = {}
const Axios = axios.create({
  timeout: 10000,
  responseType: 'json',
  // 是否允许带cookie这些
  withCredentials: true,
  // 参数序列化
  // paramsSerializer (params) {
  //   if (typeof params !== 'string') {
  //     if (({}).toString.call(params) !== '[object FormData]') {
  //       return qs.stringify({
  //         _t: new Date().getTime(),
  //         ...params
  //       }, {arrayFormat: 'brackets'})
  //     }
  //   }
  //   return params
  // },
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
  }
})

// POST传参序列化(添加请求拦截器)
Axios.interceptors.request.use(
  config => {
    config.url = config.url + (config.url.indexOf('?') === -1 ? '?' : '') + 't=' + new Date().getTime()
    // 在发送请求之前做某件事
    if (config.method === 'post') {
      if (config.headers['Content-Type'] && config.headers['Content-Type'].indexOf('x-www-form-urlencoded') > -1) {
        // 序列化
        if (typeof config.data !== 'string') {
          if (({}).toString.call(config.data) !== '[object FormData]') {
            config.data = qs.stringify(config.data)
          }
        }
      }
    }
    if (state.headers && typeof state.headers === 'object') {
      Object.assign(config.headers, state.headers)
    }
    return config
  },
  error => {
    let errText = ((error && error.data) || {}).message || '获取数据失败'
    exportDefault.Message({
      showClose: true,
      message: errText.substr(0,50),
      type: 'error'
    })
    return Promise.reject(errText)
  },
)

// 返回状态判断(添加响应拦截器)
Axios.interceptors.response.use(
  res => {
    if (res.status !== 200 && res.status !== 304 && res.status !== 400) {
      let errText = (res.data || {}).message || '获取数据失败'
      exportDefault.Message({
        //  饿了么的消息弹窗组件,类似toast
        showClose: true,
        message: errText.substr(0,50),
        type: 'error'
      })
      return Promise.reject(errText)
    }
    return res.data
  },
  config => {
    let response = config.response

    let errText = '获取数据失败'
    if (response.status !== 200 && response.status !== 304 && response.status !== 400) {
      errText = (response.data || {}).message || errText
    }
    exportDefault.Message({
      showClose: true,
      message: errText.substr(0,50),
      type: 'error'
    })
    return Promise.reject(errText)
  },
)

export function get (url, params, config) {
  let request = Axios.get(url, {
    ...config,
    params
  })
  return request
}

export function post (url, params, config = {}) {
  let request = Axios.post(url, params, config)
  return request
}

export function payload (url, params, config = {
  headers: {
    'Content-Type': 'application/json'
  }
}) {
  return post(url, params, config)
}

let install = false
// 对axios的实例重新封装成一个plugin ,方便 Vue.use(xxxx)
exportDefault.install = function(Vue) {
  if (install) {
    return
  }
  install = true
  let apiArray = [
    {
      key: '$http',
      value: Axios
    },
    {
      key: '$get',
      value: get
    },
    {
      key: '$post',
      value: post
    },
    {
      key: '$payload',
      value: payload
    }
  ]

  apiArray.forEach((item) => {
    Object.defineProperty(Vue.prototype, item.key, {value: item.value})
  })
}
export default exportDefault

```
