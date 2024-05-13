import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns



# Convert lot area to sqft so the data doesn't show acres
def convert_lot_area(row):
    if row['lotUnit'] == 'acres':
        return row['lotArea'] * 43560
    else:
        return row['lotArea']

#Data cleaning and data aggregation
def preprocess(avg_state_price, average_city_price, average_zipcode_price, df):
    # Home status isn't relevant, we want only sold houses
    # All of these houses are sold around the same time, dateSold unnecessary
    # Address, zipcode, and city are too specific to be helpful
    df = df.drop(['homeStatus', 'dateSold', 'address'], axis=1)

    # Call the convert function and drop the unit of measurement
    df['lotArea'] = df.apply(convert_lot_area, axis=1)
    df = df.drop('lotUnit', axis=1)

    # One hot encode the homeType
    df = pd.get_dummies(df, columns=['homeType'])
    
    # Add average price per state
    df = df.merge(avg_state_price, how='left', on='state')

    if 'price' in df.columns:
        df['avg_state_price'] = df['price']
        df = df.drop('price', axis=1)
    else:
        df['price'] = df['price_x']
        df['avg_state_price'] = df['price_y']
        df = df.drop(['price_x', 'price_y'], axis=1)

    # Replace Na values in state
    df['avg_state_price'] = df['avg_state_price'].fillna(df['avg_state_price'].mean())

    # Add avg price per city
    df = df.merge(average_city_price, how='left', on='city')
    if 'price' in df.columns:
        df['average_city_price'] = df['price']
        df = df.drop('price', axis=1)
    else:
        df['price'] = df['price_x']
        df['average_city_price'] = df['price_y']
        df = df.drop(['price_x', 'price_y'], axis=1)

    #Replace Na values in city
    df['average_city_price'] = df['average_city_price'].fillna(df['average_city_price'].mean())

    # Add avg price per zipcode
    df = df.merge(average_zipcode_price, how='left', on='zipcode')
    if 'price' in df.columns:
        df['average_zipcode_price'] = df['price']
        df = df.drop('price', axis=1)
    else:
        df['price'] = df['price_x']
        df['average_zipcode_price'] = df['price_y']
        df = df.drop(['price_x', 'price_y'], axis=1)

    # Replace Na values in zipcode
    df['average_zipcode_price'] = df['average_zipcode_price'].fillna(df['average_zipcode_price'].mean())  

    df = df.drop(['state', 'city', 'zipcode'], axis=1)
    return df