process.env.CHROMIUM_BIN = require('puppeteer').executablePath();
module.exports = function(config) {
  config.set({
    browsers: ['HeadlessChromium'],
    customLaunchers: {
      HeadlessChromium: {
        base: 'ChromiumHeadless',
        flags: [
          '--no-sandbox',
          '--remote-debugging-port=9222',
          '--enable-logging',
          '--user-data-dir=./karma-chrome',
          '--v=1',
          '--disable-background-timer-throttling',
          '--disable-renderer-backgrounding',
          '--proxy-bypass-list=*',
          '--proxy-server=\'direct://\''
       ]
      }
    }
  });
};
