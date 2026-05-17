git clone --recurse-submodules "https://github.com/ronanokane/StopLimitChain.git"<br>
cd StopLimitChain/


Again similar to StopLimitChain you are not subjected to the restrictions of having to have a listed pair on the Binance exchange to place an order.
You only need the SYMBOL/s to be listed on the exchange when performing a market buy or sell.

There is over 3000+ symbol tickers (USDT based) on binance that can be used to place an order initially. 

Available actions:

sellAsset.sh         &emsp;&emsp;&emsp;# a martet buy<br>
buyAsset.sh          &emsp;&emsp;&emsp;# a market sell<br>
oco.sh<br>
StopLimitChain.sh<br>
cancelOrder.sh &emsp;&emsp;# cancel manual order<br>

Example:

./oco/oco.sh SELL AAVE/USDC 2 95 90 89 && ./sellAsset.sh AAVE/USDC 100    &emsp;# sell 100 percent of the wallets AAVE for USDC <br>
./oco/oco.sh BUY AAVE/USDC 2 95 90 89 && ./buyAsset.sh AAVE/USDC 100    &emsp;# buy AAVE with 100% of wallets USDC<br>

A return code other than 0 can safely be assumed no triggure condition was met.



