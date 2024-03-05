import express from 'express'

const app = express!
const port = process.env.PORT or 3001

app.get '/' do(req, res)
	res.status(200).json
		'message': 'Welcome'

app.post '/api/translation' do(req, res)
	res.status(200).json 
		'norwegian': 'Hi'
	


imba.serve app.listen(port)
