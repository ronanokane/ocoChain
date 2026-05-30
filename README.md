Purpose
=======

Similar to a standard Binance oco except these can be placed on ticker symbols not just symbols listed as tradeable. Since it is a shell script and the action part
is another script we aren' t just limited to buy or sell as actions.

There is over 3000+ symbol tickers (USDT based) on binance that can be used to place an oco order.

Setup
-----

```
git clone --recurse-submodules "https://github.com/ronanokane/ocoChain.git"
cd ocoChain/
```

Usage
-----

```
./oco.sh <BUY|SELL> <SYMBOL> <LIMIT_PRICE_TRIGGURE> <STOP_PRICE_TRIGGURE> <STOP_PRICE_LIMIT>
```

Available actions:

```
sellAsset.sh         # martet buy
buyAsset.sh          # market sell
twoStep.sh           # two-step buy/sell router
oco.sh
StopLimitChain.sh
cancelOrder.sh       # cancel manual order

```

Examples:
######

sell 100 percent of the wallets AAVE for USDC
```
./oco.sh SELL AAVE/USDC 95 90 89 && ./StopLimitChain/sellAsset.sh AAVE/USDC 100     
```
buy AAVE with 100% of wallets USDC
```
./oco.sh BUY AAVE/USDC 95 90 89 && ./StopLimitChain/buyAsset.sh AAVE/USDC 100 
```
A return code other than 0 can safely be assumed no triggure condition was met.



