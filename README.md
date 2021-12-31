# Spatial_PaF  
Spatial prediction and forecasting  

This project is about predicting climate data at unkown locations which requires a two step approach:  
1. Predict spatial distribution  
2. Then using data from 1 to predict/forcast climate data for the next 365 days  


├── train data  
│   ├── transpose train data and join on coords  
│   ├── Krieg on transposed data and Krieg for blind  
│   └── verify accuracy of Krieg  
├── Split train for test/train and forecast on train  
│   └── verify forecast  
├── Split train for test/train and forecast on train  
│   └── verify forecast  
├── Create Map to display  
└── Publish Map  

```flow
st=>start: Start
op=>operation: Your Operation
cond=>condition: Yes or No?
e=>end

st->op->cond
cond(yes)->e
cond(no)->op
```
