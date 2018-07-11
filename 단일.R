

df<-read.csv("병원정보3.csv")
ykiho<-df[,2]
ykiho<-as.character(ykiho)


url<-"http://apis.data.go.kr/B551182/hospAsmRstInfoService/getHospWhlAsmRstList?ServiceKey=BVnt6h5rMtX52Vuu5ckoGKesnewYmnOTSYLd6GaQ4vjGnBMCgCG%2FEoMuP5StXjfQQZmrLeNU1luHjqbDDbu4cg%3D%3D&ykiho="

list<-c()
for(j in 1:length(ykiho)){
  urlf<-paste0(url,ykiho[j])
  html<-read_html(urlf)
  nodes<-html_nodes(html,"item")
  if (length(nodes)==0){
    print("empty")
    nodes<-html_node(html,"resultmsg")
  }
  list[[ykiho[j]]]<-nodes
  if (j%%100==0){
    print(j)
  }
}

llist_final<-list



out<-function(node,name){
  out<-c()
  for (i in name){
    nd<-html_nodes(node,i)
    txt<-html_text(nd)
    if (is.na(txt)||length(txt)==0){
      txt<-"null"
    }
    out<-append(out,txt)
  }
  return(out)
}
df<-rbind(c("ykiho",name))
for (i in 1:length(list)){
  row<-out(list[[i]],name)
  row<-c(names(list[i]),row)
  df<-rbind(df,row)
  if (i%%100==0){
    print(i)
  }
}

