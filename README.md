Clone in the following way.

```
git clone --recurse-submodules "https://github.com/ronanokane/ocoChain.git"
cd ocoChain/
```

Again similar to StopLimitChain you are not subjected to the restrictions of having to have a listed pair on the Binance exchange to place an order.
You only need the SYMBOL/s to be listed on the exchange when performing a market buy or sell.

There is over 3000+ symbol tickers (USDT based) on binance that can be used to place an order initially. 

Available actions:

```
sellAsset.sh         # a martet buy
buyAsset.sh          # a market sell
twoStep.sh           # a helper script to indirectly buy or sell
oco.sh<br>
StopLimitChain.sh
cancelOrder.sh       # cancel manual order

```

Examples:
######

```
./oco.sh SELL AAVE/USDC 2 95 90 89 && ./StopLimitChain/sellAsset.sh AAVE/USDC 100     sell 100 percent of the wallets AAVE for USDC
```
```
./oco.sh BUY AAVE/USDC 2 95 90 89 && ./StopLimitChain/buyAsset.sh AAVE/USDC 100    # buy AAVE with 100% of wallets USDC
```
A return code other than 0 can safely be assumed no triggure condition was met.



