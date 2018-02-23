#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <QObject>
#include <QVector>
#include <QDebug>


struct User {
    QString name;
    QString msg;
};

class ChatServer : public QObject {
    Q_OBJECT

    public:
        explicit ChatServer(QObject *parent = nullptr);
        //  this acts as the destructor of the chatserver class, it will be called after the window is closed
        ~ChatServer() { qDebug() << "chat is dead"; }
        QVector<User> users();

    signals:

    public slots:
        //  pre: this method takes in a qstring message, and a qstring username
        //  post: this methods bundle the message with corresponding username
        //  return: None
        void sendMessage(QString message, QString username);
        //  pre: None
        //  post: this methods update the qstring and update it to the scrollview later
        //  return: qstring
        QString update();
        //  pre: this method takes in a Qobject which indicates a pointer that is pointing to the QObject
        //  post: this method set all locations pointers in a vector, which acts like a queue (first store fist out)
        //  return: None
        Q_INVOKABLE void setRegister(QObject *location);
        //  pre: None
        //  post: this method returns a pointer located at index index
        //  return: a QObject pointer
        QObject* getRegister(int index);
        //  pre: None
        //  post: get the size of the vector
        //  post: return the size of the vector
        int getSize();

    private:
        //  user vector
        QVector<User> m_users;
        //  register vector
        QVector<QObject*> registerQueue;
};

#endif // CHATSERVER_H
