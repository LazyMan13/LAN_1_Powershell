clear
if (Test-Connection 147.0.0.1 -Quiet -ErrorAction Ignore) {
    Write-Host “TCP/IP stack is up” -ForegroundColor Green
    }
else {
    Write-Host “TCP/IP stack is down” -ForegroundColor Red
    }