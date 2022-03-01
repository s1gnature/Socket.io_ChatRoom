# Socket.io_ChatRoom


### 공부 자료
Application Layer에서 Transport Layer를 이용하고자 할 때(데이터를 송수신 하고자 할 때) 소켓을 통해서 작업을 수행할 수 있도록 함.
즉 소켓은 인터페이스의 역할을 가지고 있고 일종의 규격?
소켓은 양방향 통신으로 연결(connection)을 계속 살려둠.
![스크린샷 2022-03-01 오후 8 10 19](https://user-images.githubusercontent.com/48645631/156158784-8a543efa-4ea7-47a5-92b1-97b1adbf93cc.png)

#### vs HTTP
클라이언트의 요청이 있을 때 서버에서 응답을 하는 단방향 통신.
연결 방식으로 TCP(스트림), UDP(데이터그램)를 이용할 수 있음. (장단점도 TCP, UDP를 그대로 따름)
일반적으로는 응답이 끝난 후 연결이 끊어짐. (특수한 경우에 keep-alive를 통해서 살려둘 수 있음)

#### More
- TCP(3-way handshake)

### Reference
https://on1ystar.github.io/socket%20programming/2021/03/16/socket-1/
