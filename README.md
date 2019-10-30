#include<iostream>
using namespace std;

char cheker(char*clword)
{
	bool flag = true;
	bool emptyPlace = false;
	for (int j = 0; j < 301; j++)
	{
		if (flag == true&&emptyPlace==false)
		{
			for (int i = 'a'; i <= 'z'; i++)
			{
				if (clword[j] == i)
					break;
				if (i == 'z')
					flag = false;
				if (clword[j] == '\0')
				{
					emptyPlace = true;
					break;
				}
				if (clword[j] == ' ')
				{
					emptyPlace = true;
					break;
				}
			}
		}
	}
	return flag;
}

char foo_newString(char* arr, char* mass)
{
	for (int j = 0; j < 301; j++)
	{
		if (arr[j] == 'Н')
			break;
		mass[j] = arr[j];
	}
	return*mass;
}

char foo(char* clStr,char*clWord)
{
	char* newStr = new char[301];
	if (cheker(clWord) == true)
	{
		int i = 0;
		for(; i < 301; i++)
		{
			if (clWord[i] == '\0')
				break;
			newStr[i] = clWord[i];
		}
		newStr[i] = ' ';
		for (int c = 0; c < 301; c++)
		{
			i++;
			if (clStr[c] == '\0')
				break;
			newStr[i] = clStr[c];
		}
		//______________________________
		foo_newString(newStr, clStr);
	}
	else
	{
		int b = 0;
		for (; b < 301; b++)
		{
			if (clStr[b] == '\0')
				break;
			newStr[b] = clStr[b];
		}
		newStr[b] = ' ';
		for (int d = 0; d < 301; d++)
		{
			b++;
			if (clWord[d] == '\0')
				break;
			newStr[b] = clWord[d];
		}
		//________________________________
		foo_newString(newStr, clStr);
	}
	return *clStr;
}

void main()
{
	char* str = new char[301];
	cin.getline(str, 301);
	char* word = new char[301];
	cin.getline(word, 301);
	char* secWord = new char[301];
	cin.getline(secWord, 301);
	char* thirdWord = new char[301];
	cin.getline(thirdWord, 301);
	foo(str,thirdWord);
	foo(str, secWord);
	foo(str, word);
	for (int j = 0; j < 301; j++)
	{
		if (str[j] == 'Н')
			break;
		cout << str[j];
	}
	delete[]str;
	delete[]word;
	delete[]secWord;
	delete[]thirdWord;
}
