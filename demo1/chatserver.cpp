#include "chatserver.h"

ChatServer::ChatServer(QObject *parent) : QObject(parent) {
    m_message = "Hello";
}

QString ChatServer::message() {
    return m_message;
}

void ChatServer::sendMessage(const QString message) {
    if(m_message == message) {
        return;
    }
    m_message = message;
    emit messageUpdate();
}
