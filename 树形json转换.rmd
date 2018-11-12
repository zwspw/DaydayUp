### id 和 pid 转换成树形结构

```
 let pos={}
            let tree=[]
            let i=0
            while(data.length!=0){
                if(data[i].parentId==null){
                    tree.push({
                        id:data[i].id,
                        subjectName: data[i].subjectName,
                        overspendReason:data[i].overspendReason,
                        children:[]
                    });
                    pos[data[i].id]=[tree.length-1];    
                     data.splice(i,1);
                    i--;
                }else{
                    let posArr=pos[data[i].parentId];
                    if(posArr!=undefined){
                        let obj=tree[posArr[0]];
                        for(let j=1;j<posArr.length;j++){
                            obj=obj.children[posArr[j]];
                        }
                        obj.children.push({
                            id:data[i].id,
                            subjectName: data[i].subjectName,
                            overspendReason:data[i].overspendReason,
                            children:[]
                        });
                        pos[data[i].id]=posArr.concat([obj.children.length-1]);
                        data.splice(i,1);
                        i--;
                    }
                }
                i++;
                if(i>data.length-1){
                    i=0;
                }
            }
            //  return tree;
            this.opoo = tree
```
