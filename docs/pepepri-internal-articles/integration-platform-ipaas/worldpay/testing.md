---
title: "Testing"
description: "This section contains samples of requests and data which can be used for testing."
order: 194
---
# Testing

*This section contains samples of requests and data which can be used for testing.*

### Testing

For test withdrawal and full withdrawal can be used the same task, but we separate those operations to have separate logs.

In “Get Access Token” and “Get Response Packet” tasks we use http:

[https://cert-xipayapi.paymetric.com/PMXIGGE/XiPay30WS.asmx](https://cert-xipayapi.paymetric.com/PMXIGGE/XiPay30WS.asmx)

It can be in use for development, for production usage we need to remove “cert-“ from http:

[https://xipayapi.paymetric.com/PMXIGGE/XiPay30WS.asmx](https://xipayapi.paymetric.com/PMXIGGE/XiPay30WS.asmx)

For testing can be in use this cards numbers:

\- 373953192351004 - AmEx

\- 4012000033330026 - Visa

\- 6011000990099818 - Discover

\- 5424180279791732 - MasterCard

\- 4111111111111111 - Visa

And a card to get bad response:

\- 5555555555554444 – MasterCard

The whole information about cards and responses you can read in Cards and responses information PDF file.
