import json
from tweepy import OAuthHandler, Stream, StreamListener
from datetime import datetime

# cadastrar as chaves de acesso
consumer_key = 'cB9hCAyxyFye98kFjzvlht55q'
consumer_secret = 'OMkSWaz974wVtGS7J8U78uxsoYrsW68xXtxQ50PLgus7ewmILc'
access_token  = '1332065578643841024-nXgaMr91YwmeVqHn0SDXKVJIzeIkI0'
access_token_secret = 'hZREWp02U4u3NonzcftENHWgG4LIiLXbdq214uI0JdniN'

# definir um arquivo de saida para armazenar os tweets coletados
data_hoje = datetime.now().strftime('%Y-%m-%d-%H-%M-%S')
out = open(f'collected_tweets_{data_hoje}.txt','w')

# implementar uma classe para conexao com Twitter
class MyListener(StreamListener):

    def on_data(self, data):
        print(data)
        itemString = json.dumps(data)
        out.write(itemString + '\n')
        return True

    def on_error(self, status):
        print(status)

if __name__ == "__main__":
    # implementando a função main
    l = MyListener()
    auth = OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)

    stream = Stream(auth, l)
    stream.filter(track = ['Mibr', 'MIBR', 'Furia'])


