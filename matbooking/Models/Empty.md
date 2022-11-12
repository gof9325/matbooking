#  <#Title#>

{
      "id": "d91cab5e-941e-44bd-bc6f-bb2db608c9b8",
      "reservationRestrictions": {
        "paxMin": 2,
        "paxMax": 10,
        "slotGapMinutes": 60,
        "daysReservableInFuture": 1,
        "openingHours": {
          "3": {
            "end": "23:59",
            "start": "09:54"
          },
          "4": {
            "end": "22:00",
            "start": "09:00"
          },
          "5": {
            "end": "22:00",
            "start": "09:00"
          },
          "6": {
            "end": "18:54",
            "start": "06:55"
          }
        }
      },
      "storeInfo": {
        "name": "테스트 수정 수정",
        "subtitle": "없음",
        "picturesFolderId": "43c38290-c232-4795-92e5-4d3c680f763d",
        "description": "테스트 가게 수정2233333",
        "address": "서울 강남구 밤고개로15길 20-1",
        "phone": "0102323020",
        "openingHours": "테스트 영업 설명 수정22",
        "city": "부산",
        "cuisine": "이탈리아음식",
        "pictures": [
          {
            "id": "24a96e7b-4142-4e01-bba3-c5199b3f47b7",
            "createdAt": "2022-11-08T13:28:30.000Z",
            "updatedAt": "2022-11-08T13:28:40.000Z",
            "url": "https://swift-memos-images.s3.ap-northeast-2.amazonaws.com/43c38290-c232-4795-92e5-4d3c680f763d/24a96e7b-4142-4e01-bba3-c5199b3f47b7",
            "extension": "png",
            "size": 39314,
            "originalname": "2EA53F34-5A0A-42EA-AECC-FD1C888CE245.png",
            "fileFolderId": "43c38290-c232-4795-92e5-4d3c680f763d"
          }
        ]
      }
    }

reservation

{
  "success": true,
  "error": "",
  "data": [
    {
      "id": "bf19580f-4b5c-4e99-bd9f-fe353c477ca4",
      "date": "2022-12-01T04:35:00.000Z",
      "pax": 2,
      "store": {
        "id": "52ca047e-de8b-44e4-a995-c1dcf651877c",
        "storeInfo": {
          "name": "황가네 돼지국밥",
          "subtitle": "없음",
          "picturesFolderId": "abcdefg",
          "description": "진하고 깊은 맛의 돼지국밥",
          "address": "경기 성남시 분당구 대왕판교로 477",
          "phone": "0212341234",
          "openingHours": "주차장 없음",
          "city": "부산",
          "cuisine": "한식"
        }
      }
    }
  ],
  "message": ""
}

/reservations POST
{
 storeId: string,
 pax: number,
 date: string, // 2022-01-01
 time: string, // 15:30
}

/reservations GET (고객용, 예약 목록 들고오기) response
파라미터 없음
{
  "success": true,
  "error": "",
  "data": [
    {
      "id": "bf19580f-4b5c-4e99-bd9f-fe353c477ca4",
      "date": "2022-12-01T04:35:00.000Z",
      "pax": 2,
      "store": {
        "id": "52ca047e-de8b-44e4-a995-c1dcf651877c",
        "storeInfo": {
          "name": "황가네 돼지국밥",
          "subtitle": "없음",
          "picturesFolderId": "abcdefg",
          "description": "진하고 깊은 맛의 돼지국밥",
          "address": "경기 성남시 분당구 대왕판교로 477",
          "phone": "0212341234",
          "openingHours": "주차장 없음",
          "city": "부산",
          "cuisine": "한식"
        }
      }
    }
  ],
  "message": ""
}
