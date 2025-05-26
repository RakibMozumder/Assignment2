1.	What is PostgreSQL? 
PostgreSQL একটি শক্তিশালী, ওপেন-সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি SQL (Structured Query Language) ব্যবহার করে ডেটা সংরক্ষণ, পরিচালনা এবং পুনরুদ্ধার করতে সাহায্য করে। PostgreSQL ACID (Atomicity, Consistency, Isolation, Durability) মেনে চলে।
3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.  
Primary Key এমন একটি কলাম (বা কলামসমূহ), যা প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করে। এটি NULL হতে পারে না এবং প্রতিটি মান ইউনিক হতে হবে।
Foreign Key এমন একটি কলাম যা অন্য টেবিলের Primary Key-এর সাথে সম্পর্ক তৈরি করে। এটি ডেটার ইন্টিগ্রিটি বজায় রাখতে সাহায্য করে।
PostgreSQL-এ উদাহরণ:
rangers টেবিলের ranger_id একটি Primary Key।
sightings টেবিলে ranger_id একটি Foreign Key হিসেবে ব্যবহৃত হয়, যা rangers টেবিলের সাথে সম্পর্কিত।
এই সম্পর্কগুলো ডেটাবেজে referential integrity নিশ্চিত করে  অর্থাৎ এক টেবিলের তথ্য অন্য টেবিলের সাথে মিল রেখে থাকতে বাধ্য করে।
4.What is the difference between the VARCHAR and CHAR data types?  
CHAR(n) একটি fixed-length ডেটা টাইপ। এটি নির্দিষ্ট সংখ্যক ক্যারেক্টার সংরক্ষণ করে, কম হলে ফাঁকা স্থান দিয়ে পূরণ করে।
VARCHAR(n) একটি variable-length ডেটা টাইপ। এটি শুধুমাত্র প্রয়োজনীয় সংখ্যক ক্যারেক্টার সংরক্ষণ করে।
উদাহরণ:
CHAR(10) এ "Rakib" ইনসার্ট করলে তা "Rakib     " হয়ে যায়।
VARCHAR(10) এ "Rakib" ইনসার্ট করলে তা শুধুই "Rakib" থাকবে।
VARCHAR সাধারণত বেশি ব্যবহৃত হয় কারণ এটি মেমোরি সাশ্রয়ী।
5.Explain the purpose of the WHERE clause in a SELECT statement.  
WHERE ব্যবহার করে ডেটা ফিল্টার করা হয়, যাতে শুধুমাত্র নির্দিষ্ট শর্ত পূরণ করা রেকর্ডগুলো রিটার্ন হয়।
উদাহরণ:
SELECT * FROM sightings WHERE location LIKE '%Pass%';
এই কোয়েরি কেবল সেই সাইটিংস দেখাবে যেখানে লোকেশন নামের মধ্যে "Pass" আছে।
WHERE ছাড়া সব রেকর্ড রিটার্ন হয়, যা প্রয়োজনীয় ফলাফল থেকে বিভ্রান্ত করতে পারে।

9. Explain the GROUP BY clause and its role in aggregation operations.
GROUP BY একাধিক রেকর্ডকে নির্দিষ্ট কলামের উপর ভিত্তি করে গ্রুপ করে এবং সেই গ্রুপগুলোর উপর Aggregate Function (COUNT(), SUM(), AVG()) প্রয়োগ করতে সাহায্য করে।
উদাহরণ:
SELECT ranger_id, COUNT(*) AS total_sightings
FROM sightings
GROUP BY ranger_id;
এখানে প্রতিটি রেঞ্জার কতবার সাইটিং করেছেন তার সংখ্যা গণনা করা হচ্ছে।
GROUP BY মূলত বড় ডেটা থেকে তথ্য বিশ্লেষণে গুরুত্বপূর্ণ ভূমিকা পালন করে।






