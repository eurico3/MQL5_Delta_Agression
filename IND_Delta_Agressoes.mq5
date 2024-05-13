//+------------------------------------------------------------------+
//|                                         Novo_Delta_Agressoes.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property indicator_separate_window

#property indicator_buffers 2
#property indicator_plots   2


//--- Line properties are set using the compiler directives
#property indicator_label1  "Agressoes_Compra"        // Name of a plot for the Data Window
#property indicator_type1   DRAW_LINE        // Type of plotting is line
#property indicator_color1  clrGreen      // Line color
#property indicator_style1  STYLE_SOLID      // Line style
#property indicator_width1  2

#property indicator_label2  "Agressoes_Venda"        // Name of a plot for the Data Window
#property indicator_type2   DRAW_LINE        // Type of plotting is line
#property indicator_color2  clrRed      // Line color
#property indicator_style2  STYLE_SOLID      // Line style
#property indicator_width2  2

//-- Buffers de Indicadors

double    Agressoes_Compra[];
double    Agressoes_Venda[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
//--- indicator buffers mapping
SetIndexBuffer(0,Agressoes_Compra,INDICATOR_DATA);    
SetIndexBuffer(1,Agressoes_Venda,INDICATOR_DATA);

ArrayInitialize(Agressoes_Compra,EMPTY_VALUE);
ArrayInitialize(Agressoes_Venda,EMPTY_VALUE); 
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
MqlTick ultimoTick;


  {
//---
   if(SymbolInfoTick(_Symbol, ultimoTick))
     {

        if ((ultimoTick.flags & TICK_FLAG_BUY) == TICK_FLAG_BUY)
           {

             Agressoes_Compra[rates_total-1] += ultimoTick.volume_real;

             
           }
       
       
        if ((ultimoTick.flags & TICK_FLAG_SELL) == TICK_FLAG_SELL)
           {

             Agressoes_Venda[rates_total-1] += ultimoTick.volume_real;

           }

      }
  }
   return(rates_total);
  }
//+------------------------------------------------------------------+




