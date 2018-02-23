#include "chatserver.h"
//#include "client.h"

ChatServer::ChatServer(QObject *parent) : QObject(parent) {

}

QVector<User> ChatServer::users() {
    return m_users;
}

void ChatServer::sendMessage(QString message, QString username) {
    User new_user;
    new_user.name = username;
    new_user.msg = message;
    m_users.append(new_user);
}

QString ChatServer::update()
{
    QString final;

    for(int i = 0; i < m_users.size(); ++i) {
        if(m_users.at(i).name == m_users.at(0).name) {
            final += "<b><font color = \"red\">" + m_users.at(i).name + ":</font></b>" + m_users.at(i).msg + "<br>";
        } else {
            final += "<b><font color = \"blue\">" + m_users.at(i).name + ":</font></b>" + m_users.at(i).msg + "<br>";
        }
    }
    return final;
}
