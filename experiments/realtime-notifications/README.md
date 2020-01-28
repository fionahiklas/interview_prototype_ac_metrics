## Overview

Looking into mechanisms to handle real-time communications

## Socket.io

There is an npm package that supports [websockets in node.js](https://www.npmjs.com/package/socket.io)

It actually supports several types of comms and will use WebSockets if available.

The problem is that WebSockets will not easily scale since they pin a client to a given server.

Some discussion on [WebSocket scaling](https://hackernoon.com/scaling-websockets-9a31497af051)

## Polling

This might work since the UI shouldn't need to poll that often given that the data is only 
updated every minute.  However, that's for each AC unit, they could all be sending data
such that the state of notifications changes faster than that.

Polling would be scalable though in the sense that each node would only have to deal with 
requests that 


## Questions

### Do load balancers/nodes send NAK for any websocket channels that close

Would the client see the channel close for a websocket such that there could be some way to recover 
and reconnect?



