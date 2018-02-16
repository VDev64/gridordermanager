//+------------------------------------------------------------------+
//|                                             GridOrderManager.mqh |
//|                        Copyright 2018, Alexey Volchanskiy.       |
//|                              https://www.mql5.com/ru/users/vdev/ |
//+------------------------------------------------------------------+
#ifdef __MQL5__
    #include <Trade\Trade.mqh>
#endif


class CAvOrder : public CObject
{
#ifdef __MQL5__
    CTrade m_trade;
#endif

#ifdef __MQL5__
protected:
    const   int         m_ticket;
    const   string      m_symbol;
    const   int         m_magic;
    const   int         m_cmd;
    const   datetime    m_openTime;
    const   double      m_openPrice;
    const   double      m_lot;
    CAvOrder(){ }
public:
    double  m_stoploss;
    double  m_takeProfit;
    datetime m_closeTime;
    double  m_closePrice;
    double  m_profit;
    double  m_swap;
    double  m_comission;
    datetime m_expiration;
    string  m_comment;

    CAvOrder(int ticket, string symbol, int cmd, double lot, double price, datetime openTime, int magic = 0, double stoploss = 0,
        double takeprofit = 0, string comment = NULL, datetime expiration = 0, color arrow_color=CLR_NONE) : 
        m_ticket(ticket), m_symbol(symbol), m_magic(magic), m_cmd(cmd), m_openTime(openTime), m_openPrice(price), m_lot(lot)
    {
        SetParams(stoploss, takeprofit, comment, expiration);
    }
    
    ~CAvOrder(){}
    
    void GetStableParams(int& ticket, string&  symbol, int& magic, int& cmd, datetime& openTime, double& openPrice, double& lot)
    {
        ticket = m_ticket; 
        symbol = m_symbol;
        magic = m_magic;
        cmd = m_cmd;
        openTime = m_openTime;
        openPrice = m_openPrice;
        lot = m_lot;
    }
    
    void SetParams(double stoploss = 0, double takeprofit = 0, string comment = NULL, datetime expiration = 0)
    {
        m_stoploss = stoploss;
        m_takeProfit = takeprofit;
        m_comment = comment;
        m_expiration = expiration;
    }

#endif


};