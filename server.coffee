express  = require 'express'

PORT        = process.env.PORT || 3000


app = express()
app.set 'port', PORT

app.use(express.static(__dirname + '/dist'))
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/frontend/templates'

# Until the image optimisation process isn't implemented, hack it like this:
app.use '/img', express.static(__dirname + '/frontend/images')
app.use '/lib', express.static(__dirname + '/frontend/bower_components')

app.get '/', (req, res) ->
    return res.render('index')

app.get '/detail', (req, res) ->
	return res.render('detail', req.query)

if not module.parent
    app.listen app.get('port')
    console.log '\n' + 'Server started and listening on port:' + app.get('port')

module.exports = app
