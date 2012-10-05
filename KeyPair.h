/* ****************************************************************************
 * 
 * 				KeyPair.h
 * 
 * Author: Nedim Srndic
 * Release date: 17th of June 2008
 * 
 * A class representing a public/private RSA keypair. 
 * 
 * A keypair consists of a public key and a matching private key. 
 * 
 * ****************************************************************************
 */

#ifndef KEYPAIR_H_
#define KEYPAIR_H_

#include "Key.h"
#include <iostream>

class KeyPair
{
	private:
		const Key privateKey;
		const Key publicKey;
	public:
		KeyPair(Key privateKey, Key publicKey): 
			privateKey(privateKey), publicKey(publicKey)
		{}
		const Key &GetPrivateKey() const
		{
			return privateKey;
		}
		const Key &GetPublicKey() const
		{
			return publicKey;
		}
		friend std::ostream &operator <<(std::ostream &cout, const KeyPair &k);
};

#endif /*KEYPAIR_H_*/
