#include "videolauncher.h"
#include <QDesktopServices>
#include <QUrl>
#include <QDebug>

VideoLauncher::VideoLauncher(QObject *parent) :
    QObject(parent)
{
}

void VideoLauncher::launchVideo(const QString &url)
{
    qDebug() << "Launch:" << url;
    QDesktopServices::openUrl(QUrl(url));
}
