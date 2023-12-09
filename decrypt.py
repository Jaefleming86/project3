import boto3
import json


session = boto3.session.Session()

secretsmanager = session.client(service_name='secretsmanager', region_name='eu-west-1')


secret_name = 'my_secret_name'

def get_secret(secret_name, username):
    try:
        
        get_secret_value_response = secretsmanager.get_secret_value(SecretId=secret_name)

        
        if 'SecretString' in get_secret_value_response:
            secret = get_secret_value_response['SecretString']
            secret_dict = json.loads(secret)
            
            
            user_credentials = secret_dict.get(username)
            if user_credentials:
                return user_credentials
            else:
                raise Exception(f"Credentials for user '{username}' not found in secret.")
        else:
            raise Exception("Secret not found or not a string.")
    except Exception as e:
        print(f"Error retrieving secret: {str(e)}")
        return None


user_credentials = get_secret(secret_name, 'Malak')
if user_credentials:
    print("Access Key: ", user_credentials.get("AccessKey"))
    print("Secret Access Key: ", user_credentials.get("SecretAccessKey"))
