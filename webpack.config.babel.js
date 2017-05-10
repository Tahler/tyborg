import webpack from 'webpack';
import path from 'path';
import merge from 'webpack-merge';
import HtmlWebpackPlugin from 'html-webpack-plugin';
import autoprefixer from 'autoprefixer';
import ExtractTextPlugin from 'extract-text-webpack-plugin';
import CopyWebpackPlugin from 'copy-webpack-plugin';

const entryPath = path.resolve(__dirname, 'src/static/index.js');
const outputPath = path.resolve(__dirname, 'dist');

// determine build env based on npm run
const targetEnv = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development';
const outputFilename = targetEnv === 'production' ? '[name]-[hash].js' : '[name].js';

const commonConfig = {
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

let envConfig;
if (targetEnv === 'development') {
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
} else if (targetEnv === 'production') {
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

const config = merge(commonConfig, envConfig);

export default config;
