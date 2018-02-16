#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <QObject>

class ChatServer : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString message READ message WRITE sendMessage NOTIFY messageUpdate)

    public:
        explicit ChatServer(QObject *parent = nullptr);
        QString message();

    signals:
        void messageUpdate();

    public slots:
        void sendMessage(const QString message);

    private:
        QString m_message;

};

#endif // CHATSERVER_H
