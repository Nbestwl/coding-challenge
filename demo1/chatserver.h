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
        ~ChatServer() {
            //  prompt the user that the destructor is being called
            qDebug() << "start deleting a chat block object...";
            //  this while loop will loop through all indexes and delete all pointers stored there in registerQueue
            while(registerQueue.size() > 0) {
                delete registerQueue.takeAt(0);
            }
            //  pop the vector container in the end
            registerQueue.clear();

            //  this while loop will loop through all indexes and delete all pointers stored there in m_users
            while(m_users.size() > 0) {
                delete m_users.takeAt(0);
            }
            //  pop the vector container in the end
            m_users.clear();
            //  prompt the user the destructor is completed
            qDebug() << "The chat is now dead";
        }

    signals:

    public slots:
        //  pre: this method takes in a qstring message, and a qstring username
        //  post: this methods bundle the message with corresponding username
        //  return: None
        Q_INVOKABLE void sendMessage(QString message, QString username);
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
        QVector<User*> m_users;
        //  register vector
        QVector<QObject*> registerQueue;
};

#endif // CHATSERVER_H
