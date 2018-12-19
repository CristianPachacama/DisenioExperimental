#Grafico de Cajas
# p = plot_ly(tabla, y = ~Puntos, color = ~Grupo, type = "box",boxpoints = 'all')
p=ggplot(data=tabla, aes(x=factor(Molde), y=Hinchamiento,fill=Catalizador))+
  geom_boxplot()+
  facet_grid(.~Catalizador)+
  labs(x="Molde")+
  theme(axis.text.x=element_text(angle=-90, vjust=0.4,hjust=1)) +
  # geom_dotplot(binaxis='y', stackdir='center', dotsize=1)+ 
  geom_jitter(shape=16, position=position_jitter(0.2)) +
  stat_summary(fun.y=mean, geom="point", shape=23, size=4)
# plot(p)
p=ggplotly(p)

