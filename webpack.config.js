var path = require('path');
var webpack = require('webpack');
var merge = require('webpack-merge');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var autoprefixer = require('autoprefixer');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var CopyWebpackPlugin = require('copy-webpack-plugin');
var entryPath = path.join(__dirname, 'src/static/index.js');
var outputPath = path.join(__dirname, 'dist');

// determine build env based on npm run
var TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development';
var outputFilename = TARGET_ENV === 'production' ? '[name]-[hash].js' : '[name].js';

var commonConfig = {
  output: {
    path: outputPath,
    filename: `static/js/${outputFilename}`,
  },
  resolve: {
    extensions: ['.js', '.elm']
  },
  module: {
    noParse: /\.elm$/,
    loaders: [
      {
        test: /\.(eot|ttf|woff|woff2|svg)$/,
        loader: 'file-loader'
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: 'src/static/index.html',
      inject: 'body',
      filename: 'index.html'
    })
  ],
};

var envConfig;
if (TARGET_ENV === 'development') {
  envConfig = {
    entry: [
      'webpack-dev-server/client?http://localhost:8080',
      entryPath
    ],
    devServer: {
      // serve index.html in place of 404 responses
      historyApiFallback: true,
      contentBase: './src',
    },
    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: [
            {
              loader: 'elm-hot-loader',
            },
            {
              loader: 'elm-webpack-loader',
              options: {
                verbose: true,
                warn: true,
                debug: true,
              },
            },
          ],
        },
        {
          test: /\.(css|scss)$/,
          use: [
            'style-loader',
            'css-loader',
            'sass-loader'
          ],
        },
      ],
    },
  };
} else if (TARGET_ENV === 'production') {
  envConfig = {
    entry: entryPath,
    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          loader: 'elm-webpack-loader'
        },
        {
          test: /\.(css|scss)$/,
          use: ExtractTextPlugin.extract({
            fallback: 'style-loader',
            use: [
              'css-loader',
              'sass-loader',
            ],
          }),
        }
      ]
    },
    plugins: [
      new CopyWebpackPlugin([
        {
          from: 'src/static/img/',
          to: 'static/img/'
        },
        {
          from: 'src/favicon.ico'
        },
      ]),
      new ExtractTextPlugin({
        filename: 'static/css/[name]-[hash].css',
        allChunks: true,
      }),
      new webpack.optimize.UglifyJsPlugin({
        sourceMap: true,
        minimize: true,
      })
    ]
  };
}

module.exports = merge(commonConfig, envConfig);
