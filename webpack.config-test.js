var webpack = require('webpack');
var path = require('path');
var nodeExternals = require('webpack-node-externals');

module.exports = {
  output: {
    // sourcemap support for IntelliJ/Webstorm
    devtoolModuleFilenameTemplate: '[absolute-resource-path]',
    devtoolFallbackModuleFilenameTemplate: '[absolute-resource-path]?[hash]'
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "babel-loader",
        query: {
          presets: ['es2015', 'react'],
          plugins: ['transform-react-jsx', 'transform-object-rest-spread']
        }
      }
    ]
  },
    plugins: [
    new webpack.ProvidePlugin({
      'deepFreeze': 'deep-freeze',
      'React': 'react',
      'ReactDom': 'react-dom',
      'Redux': 'redux'
    }),
  ],
  resolve: {
    root: [path.resolve(__dirname, 'src'), path.resolve(__dirname, 'node_modules')]
  },
  target: 'node',
  externals: [nodeExternals()],
  devtool: "cheap-module-source-map"
};
