create database Facebook;
use Facebook;

Create table user_profile(
	username varchar(20) primary key,
    name_first varchar(25),
    name_last varchar(25),
    user_password varchar(8),
    date_of_birth datetime
);
Create table user_post(
	post_id varchar(10) primary key,
    created_timestamp datetime,
    modified_timestamp datetime,
    text_content varchar(100),
    username varchar(20),
    foreign key (username) references user_profile(username)
);
create table post_like(
	post_like_id varchar(10) primary key,
    time_stamp datetime,
    post_id varchar(10),
    username varchar(20),
    foreign key (post_id) references user_post(post_id),
    foreign key (username) references user_profile(username)
);
create table post_comment(
	post_comment_id varchar(10) primary key,
    time_stamp datetime,
    text_content varchar(100),
    post_id varchar(10),
    username varchar(20),
    foreign key (post_id) references user_post(post_id),
    foreign key (username) references user_profile(username)
);