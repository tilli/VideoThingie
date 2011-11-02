#ifndef VIDEOLAUNCHER_H
#define VIDEOLAUNCHER_H

#include <QObject>

class VideoLauncher : public QObject
{
    Q_OBJECT

public:
    explicit VideoLauncher(QObject *parent = 0);

    Q_INVOKABLE void launchVideo(const QString &url);

signals:

public slots:

};

#endif // VIDEOLAUNCHER_H
