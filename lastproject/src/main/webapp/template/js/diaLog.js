//블록체인 연결
			console.log('starting...');
			web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:8545'));
			 if(web3) 
			     console.log('connected');
			 else 
			     console.log('not connected');
			
			
			//web3.eth.defaultAccount = web3.eth.accounts[0];와 같은의미
			//첫번째 계정 조회
			let account;
			
			web3.eth.getAccounts(function(err,accs){
			    if(err != null){
			        alert('There was an error fetching your accounts.')
			        return
			    }
			    if(accs.length ===0){
			        alert("Couldn't get any accounts!")
			        return
			    }
			    account = accs[0];
			})
			    // 여기에 우리가 만든 컨트랙트에 접근하는 방법을 제시한다:
			var abi = [
				{
					"constant": true,
					"inputs": [
						{
							"name": "",
							"type": "uint256"
						}
					],
					"name": "diaLogMapping",
					"outputs": [
						{
							"name": "r_no",
							"type": "uint256"
						},
						{
							"name": "d_name",
							"type": "string"
						},
						{
							"name": "result",
							"type": "string"
						},
						{
							"name": "symptom",
							"type": "string"
						},
						{
							"name": "w_date",
							"type": "string"
						}
					],
					"payable": false,
					"type": "function",
					"stateMutability": "view"
				},
				{
					"constant": false,
					"inputs": [
						{
							"name": "r_no",
							"type": "uint256"
						},
						{
							"name": "d_name",
							"type": "string"
						},
						{
							"name": "result",
							"type": "string"
						},
						{
							"name": "symptom",
							"type": "string"
						},
						{
							"name": "w_date",
							"type": "string"
						}
					],
					"name": "diagnosis",
					"outputs": [],
					"payable": false,
					"type": "function",
					"stateMutability": "nonpayable"
				}
			]/* abi generated by the compiler */
			
			var contractAddress = "0xe78095A653D240434afBaF4333ba802D4D14eaA7"; /* our contract address on Ethereum after deploying */
			var adoption = new web3.eth.Contract(abi,contractAddress);
			
			
			
