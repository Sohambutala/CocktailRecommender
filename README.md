# Cocktail Recommender

## Overview

This project is aimed at creating a cocktail recommendation system using BERT-based embeddings to provide cocktail recommendations based on user preferences. The system extracts cocktail recipe text from a dataset, calculates BERT embeddings for each recipe, and matches the user's input with the most similar cocktail recipes.

## Dataset

The dataset used in this project was obtained from the Hugging Face Datasets library. The specific dataset is the [**Cocktails Recipe (No Brand)**](https://huggingface.co/datasets/erwanlc/cocktails_recipe_no_brand?row=0) dataset. It contains information about various cocktails, including their ingredients and recipes. A sample of the dataset is shown below:

| title               | glass           | garnish                       | recipe                                                         | ingredients                                                            |
|---------------------|-----------------|-------------------------------|---------------------------------------------------------------|-------------------------------------------------------------------------|
| Abacaxi Ricaço      | Pineapple shell (frozen) glass | Cut a straw sized hole in the top of the pineapple and carefully carve out the insides... | Cut the top off a small pineapple and carefully carve out the insides to create a serving glass. Enjoy your drink using the pineapple shell. | [['1 whole', 'Pineapple (fresh)'], ['9 cl', 'H... |
| Abbey               | Coupe glass      | Orange zest twist             | SHAKE all ingredients with ice and fine strain into glass.    | [['4.5 cl', 'Rutte Dry Gin'], ['2.25 cl', 'Lil... |
| A.B.C. Cocktail     | Nick & Nora glass | Lemon zest twist & Luxardo Maraschino cherry | TEAR mint and place in shaker. Add other ingredients and shake with ice. Double strain into glass. | [['7 fresh', 'Mint leaves'], ['3 cl', 'Tawny p... |
| Absinthe Cocktail   | Coupe glass      | Mint leaf                     | SHAKE all ingredients with ice and fine strain into glass.    | [['3 cl', 'La Fée Parisienne absinthe'], ['7.5... |
| Absinthe Frappé     | Old-fashioned glass | Mint sprig                 | SHAKE all ingredients with ice and fine strain into glass.    | [['4.5 cl', 'La Fée Parisienne absinthe'], ['1... |

The dataset includes the cocktail's title, glass type, garnish, recipe, and a list of ingredients along with their quantities.

## Data Preprocessing

Before calculating BERT embeddings, the project pre-processes the cocktail recipe text, such as removing newline characters, special characters, and formatting, to ensure that the data is suitable for BERT embedding extraction.

## Data Processing and Storage
The project involves the extraction and storage of BERT-based embeddings for cocktail recipes using the Hugging Face Transformers library. These embeddings are then stored as JSON files in Azure Blob Storage, and a pipeline in SingleStore is set up to transfer the data into a SingleStore database.

## Embedding Extraction
To generate BERT embeddings for cocktail recipe text, the project initializes a BERT model and tokenizer using the Hugging Face Transformers library. The BertModel and BertTokenizer are loaded with the specified model name (default: 'bert-base-uncased').

## JSON Data Preparation
The cocktail recipe text is preprocessed and tokenized to prepare it for embedding extraction. BERT embeddings are extracted and stored as JSON data, including the cocktail name, recipe text, and corresponding vector representation.

## Storage in Azure Blob Storage
The extracted JSON data is uploaded to Azure Blob Storage. Azure Blob Storage is a scalable and secure cloud storage solution that provides data storage capabilities for various data types, including JSON files.

## SingleStore Pipeline
A pipeline is established in SingleStore, a distributed relational database management system. This pipeline transfers the JSON data stored in Azure Blob Storage into a SingleStore database for further processing and analysis.

This data processing and storage workflow allows for efficient management of BERT embeddings and cocktail data, making them accessible for various analytical tasks in SingleStore.

## Functions

- `initialize_bert(model_name='bert-base-uncased')`: Initializes a BERT model and tokenizer.
- `extract_cocktail_embedding(model, tokenizer, cocktails)`: Extracts BERT-based embeddings for cocktail recipe text.
- `upload_vectors_to_azure(data_list, name="CocktailsVector.json")`: Uploads cocktail vectors to Azure Blob Storage.
- `retrieve_top_cocktail_matches(name, embedding)`: Retrieves the top cocktail matches based on a given embedding using SingleStore.

## Usage

1. Initialize the BERT model and tokenizer.
2. Extract BERT embeddings for the cocktails in the dataset.
3. Upload the embeddings to Azure Blob Storage.
4. Retrieve top cocktail matches based on user preferences.

## Credits

- Dataset: [**Cocktails Recipe (No Brand)**](https://huggingface.co/datasets/erwanlc/cocktails_recipe_no_brand?row=0)
- BERT model: [**BERT by Hugging Face**](https://huggingface.co/transformers/model_doc/bert.html)

Please refer to the provided code for implementation details and how to use the functions.

