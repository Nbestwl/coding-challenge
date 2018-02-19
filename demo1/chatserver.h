#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <QObject>
#include <QVector>

struct User {
    QString name;
    QString msg;
};

class ChatServer : public QObject {
    Q_OBJECT

    public:
        explicit ChatServer(QObject *parent = nullptr);
        QVector<User> users();

    signals:

    public slots:
        void sendMessage(QString message, QString username);
        QString update();

    private:
        QVector<User> m_users;
};

#endif // CHATSERVER_H
