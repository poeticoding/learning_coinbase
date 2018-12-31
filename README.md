[Realtime Market-Data Updates with Elixir](www.poeticoding.com/realtime-market-data-updates-with-elixir)

Cryptocurrency exchanges usually open their realtime feed for free and, like Coinbase Pro, without even having to create an account. This gives us a great way to build an architecture around realtime market data. 
In this article we see how to build an Elixir application to get realtime updates from the coinbase websocket feed, handling crashes and disconnections.

[Counting Real-Time Trades](https://www.poeticoding.com/counting-realtime-trades/)
In the Real-time Market-Data Updates with Elixir article, we have seen how to build a Coinbase WebSocket client and receive real-time trades. In the comments of the article, a reader asked how many trades we receive per second. In general, the rate of trades depends on the product and the time of day.
In this article we start to see how to aggregate these trades in real-time, using the GenServer behaviour. We’ll build an aggregation process that groups and count the  trades.
