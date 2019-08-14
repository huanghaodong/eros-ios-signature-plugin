
```
const Sign = weex.requireModule('sign')

Sign.open((base) => {
	//返回base64
  base = base.replace(/[\r\n]/g,"");//去掉可能的换行
  this.base = 'data:image/jpeg;base64,' + base
})

```
