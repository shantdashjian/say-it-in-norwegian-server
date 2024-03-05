import express from 'express'
import OpenAI from 'openai'
import cors from 'cors'

const app = express!
const port = process.env.PORT or 3001

const openai = new OpenAI
	apiKey: process.env.OPENAI_API_KEY

app.use express.json()
app.use cors()

app.get '/' do(req, res)
	res.status(200).json
		'message': 'Welcome to the Say It in Norwegian API'

app.post '/api/translation' do(req, res)
	const englishText = req.body.englishText
	const response = await openai.chat.completions.create
		model: "gpt-3.5-turbo",
		messages: [
			{
				"role": "system",
				"content": "You are a professional English to Norwegian translator. You give accurate translations when asked."
			},
			{
				"role": "user",
				"content": "Give me the exact translation of the following. I just want the translation, with no extra explanation: " + englishText
			}
		]
	const norwegianText = response.choices[0].message.content
	res.status(200).json 
		'norwegianText': norwegianText
	
imba.serve app.listen(port)
